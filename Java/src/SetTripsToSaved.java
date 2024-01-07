import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import javax.swing.JFileChooser;

public class SetTripsToSaved {

	private static String ProgramName = "SetTripsToSaved Version 1.0";
	private static String Warning = 
			"This program will modify the bit that defines if a trip is Saved or Imported. \n" +
	        "That will change the routing behaviour of the trip. It is only meant to be used for the Garmin Zumo XT.\n" +
			".trip files ae located in 'Internal Storage\\.System\\Trips' on the XT,\n" + 
	        "and should be copied first to your hard-drive for use with this program.\n" +
	        "After updating the trip files they should be copied back to the Garmin Zumo XT.\n\n" +
			"Use this program entirely at your own risk!";
	private static String TripExtension = ".trip";
	private static String ImportedKeyWord = "mImported";
	private static String TripNameKeyWord = "mTripName";
	private static String TripMagicKeyword = "TRPL";
	private static String UnknownFormat = "File: %s does not have the expected format. %n";
	private static byte DatatypeString = 14;
	private static byte DatatypeBool = 7;
	
	private static long AsUnsigned(short s)
	{
		long y = 0x000000000000ffffL & s;
		return y;
	}
	
	private static String GetExtension(String FileName)
	{
		String Extension = "";
	
		int i = FileName.lastIndexOf('.');
		if (i > 0) 
		{
			Extension = FileName.substring(i);
		}
		return Extension;
	}
	
	private static void SetTripToSaved(String FileName) throws Exception {
			
		long SavedFilePos;
		String TripName = "";
		Boolean ImportedFound = false;
		Boolean TripNameFound = false;
		Boolean FileModified = false;
		
		// Open file for read+write
		RandomAccessFile raf = new RandomAccessFile(FileName, "rw");

		byte[] TripMagic = new byte[4];
		raf.read(TripMagic);
		if (!new String(TripMagic, StandardCharsets.UTF_8).equals(TripMagicKeyword))
		{
			// File should start with TRPL
			System.out.printf(UnknownFormat, FileName);
			raf.close();
			return;
		}
		SavedFilePos = raf.getFilePointer();
		int FileSize = raf.readInt(); // not used. Future use.
		byte HeaderLength = raf.readByte();
		int ItemCount = raf.readInt(); // not used. Future use.
		byte HeaderTerminator = raf.readByte();
		if (HeaderTerminator != 9)
		{
			// Need a header terminator, = 0x09
			System.out.printf(UnknownFormat, FileName);
			raf.close();
			return;
		}
		
		// Seek past the header
		raf.seek(SavedFilePos + HeaderLength); 

		// Loop all items
		do 
		{
			// Get length of Item
			Integer KeyLength = raf.readInt();
			// Get Item name
			byte[] KeyNameBytes = new byte[KeyLength];
			raf.read(KeyNameBytes);
			String KeyName = new String(KeyNameBytes, StandardCharsets.UTF_8);
			// Get length of value
			Integer ValueLength = raf.readInt();
			Byte DataType = raf.readByte();
		  
			// Save file pos for seeking to next item
			SavedFilePos = raf.getFilePointer();

			// Tripname found?
			if ((DataType == DatatypeString) &&
				(KeyName.equals(TripNameKeyWord)))
			{
				TripNameFound = true;
				
				long LtripName = AsUnsigned(raf.readShort()) / 4;
				for (int i = 0; i < LtripName; i++) 
				{
					if (raf.getFilePointer() +4 > raf.length()) 
					{
						break; // Need at least 4 bytes left to read
					}
					
					// UTF-32 but stored backwards
					byte[] AChar = new byte[4];
					AChar[3] = raf.readByte();
					AChar[2] = raf.readByte();
					AChar[1] = raf.readByte();
					AChar[0] = raf.readByte();
					
					TripName += new String(AChar, Charset.forName("UTF-32"));
				}
			}
			
			// Imported found?
			if ((DataType == DatatypeBool) &&
			    (KeyName.equals(ImportedKeyWord)))
			{
				ImportedFound = true;
				
				byte OldValue = raf.readByte();
				if (OldValue != 0)
				{
					FileModified = true;
					raf.seek(SavedFilePos);
					raf.write(0);
				}
			}
			
		    // Reposition to next field  
			raf.seek(SavedFilePos + ValueLength); 
		  
		} while (raf.getFilePointer() < raf.length() &&
				(ImportedFound == false || TripNameFound == false)); // Keep scanning until we found Imported and Tripname
		
		if (ImportedFound)
		{	
			System.out.printf("File: %s, Trip: %s, Result: %s %n", 
								FileName,
								(TripNameFound) ? TripName : "Not Found",
								(FileModified) ? "Modified, Set to Saved" : "Not Modified");
		}
		else
		{
			System.out.printf(UnknownFormat, FileName);
		}
		
		// Close file and write back changes
		raf.close();
	}

	public static void main(String[] args) 
	{
		System.out.printf("%s%n%n%s%n", ProgramName, Warning);
		JFileChooser j = new JFileChooser();
		j.setCurrentDirectory(new File(System.getProperty("user.home")));
		j.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
  	  	int result = j.showOpenDialog(null);

  	  	if (result == JFileChooser.APPROVE_OPTION) 
  	  	{
  	  		File DirectoryPath = j.getSelectedFile();
  	  		File filesList[] = DirectoryPath.listFiles();
  	  		
	  	    for (File file: filesList) 
	  	    {
	  	    	if (GetExtension(file.getName()).equalsIgnoreCase(TripExtension))
	  	    	{
		  	         try
		  	         {
		  	        	 SetTripToSaved(file.getAbsolutePath());
		  	         } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return;
		  	         }
	  	    	}  	  		
	  	    }
  	  	}
	}

}

