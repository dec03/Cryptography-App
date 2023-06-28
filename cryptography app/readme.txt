Functions:
	A collection of functions used in the crypto app (you can add/change this to have a
	wider variety of encryption/hashing algorithms).


Input_files:
	Any files you would like to encrypt/hash, put them in this directory and the functions
	will search this folder to operate on them depending on the method chosen. Not all 
	of the encryption methods are able to operate on binary files (images) as I haven't
	programmed it yet, but every method will work with text files.


Output_files:
	This is where the app generates the output files from the encryption methods, 
	both encrypted files and decrypted files. If you plan to decrypt a file, 
	ensure you are referencing a file that is in the output_files folder (encrypted
	files should automatically be written there after encrypting a file).




Menu:
	Run the menu application to run the crypto app. After using the methods of encryption
	and hashing provided, the output will show for some time so you can take note of them.

	For example:
		keys
		IV
		Tags
		Name of Encrypted File

	There may be other values, but you will need these to decrypt an encrypted file 
	successfully.



Extra:
	References are provided within the code as comments, as well as text file 
	licenses within the Encryption/Hashing folders in the functions folder from 
	authors for some of the algorithms.

	This was coded in matlab, so if you can't run it on another application, try
	to run it on matlab.
