using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace IdentityTest.Helpers
{
    public class ImageHelper
    {
        /// <summary>
        /// Handles the file uploaded by user, storing it in the upload the directory and returning it's file name
        /// </summary>
        /// <param name="image">File uploaded by user</param>
        /// <returns>Name of the file stored in the uploadDirectory</returns>
        public static string HandleUpload(HttpPostedFile image, string serverPath){

            int nFileLen = image.ContentLength;
            if (nFileLen == 0)
            {
                return null;
            }

            string fileExtension = Path.GetExtension(image.FileName).ToLower();
            // Check file extension (must be JPG)
            if (!m_allowedExtensions.Contains(fileExtension))
            {
                return null;
            }

            int file_append = 0;
            string filePath = serverPath + m_uploadDirectory;
            string sFilename = Path.GetFileName(image.FileName); 

            /*
             * The commented code below is to be used when we need to save the image as it is uploaded.
             * Currently, due to avoiding filling up the storage with images, we only save the thumbs.
             */

            /*
            // Read file into a data stream
            byte[] myData = new Byte[nFileLen];
            image.InputStream.Read(myData,0,nFileLen);

            // Make sure a duplicate file doesn’t exist.  If it does, keep on appending an 
            // incremental numeric until it is unique
                       
            while (File.Exists(filePath + sFilename))
            {
                file_append++;
                sFilename = Path.GetFileNameWithoutExtension(image.FileName) + file_append.ToString() + fileExtension;
            }

            // Save the stream to disk
            FileStream newFile = new FileStream(filePath + sFilename, FileMode.Create);
            newFile.Write(myData,0, myData.Length);
            newFile.Close();
            */
            // Check whether the file is really a JPEG by opening it
            Image.GetThumbnailImageAbort myCallBack = new Image.GetThumbnailImageAbort(ImageHelper.ThumbnailCallback);
            Bitmap myBitmap;
            string sThumbFile = null;
            try
            {
                myBitmap = new Bitmap(image.InputStream);

                // If jpg file is a jpeg, create a thumbnail filename that is unique.
                file_append = 0;
                sThumbFile= Path.GetFileNameWithoutExtension(image.FileName) + m_thumbPostfix + fileExtension;
                while (File.Exists(filePath + sThumbFile))
                {
                    file_append++;
                    sThumbFile = Path.GetFileNameWithoutExtension(image.FileName) + file_append.ToString() + m_thumbPostfix + fileExtension;
                }

                // Save thumbnail and output it onto the webpage
                Image myThumbnail = myBitmap.GetThumbnailImage(m_thumbWidth, m_thumbHeight, myCallBack, IntPtr.Zero);
                myThumbnail.Save(filePath + sThumbFile);

                // Destroy objects
                myThumbnail.Dispose();
                myBitmap.Dispose();
            }
            catch (ArgumentException errArgument)
            {
                // The file wasn't a valid jpg file
                File.Delete(filePath + sFilename);
                return null;
            }

            return sFilename;
        }

        public static string GetImageUrl(string imageName)
        {
            return "~" + m_uploadDirectory + imageName;
        }

        public static string GetImageThumbUrl(string imageName)
        {
            string imageNameNoExt = Path.GetFileNameWithoutExtension(imageName);
            string fileExtension = Path.GetExtension(imageName).ToLower();
            return GetImageUrl(imageNameNoExt + m_thumbPostfix + fileExtension);
        }

        private static bool ThumbnailCallback(){
            return false;
        }

        private static int m_thumbHeight = 150;
        private static int m_thumbWidth = 190;
        private static string m_thumbPostfix = @"_thumb";
        private static string m_uploadDirectory = @"/Images/Uploads/";
        private static string[] m_allowedExtensions = new string[] { ".jpeg", ".jpg", ".png" };

    }
}