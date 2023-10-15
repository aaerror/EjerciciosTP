using System.Collections;
using System.Collections.Generic;
using System.IO;

namespace ParcialTP.DataAccess
{
    public class FileManagement
    {
        private string _path;


        public FileManagement(string path)
        {
            _path = path;
        }

        public bool ExistRecordsFile()
        {
            if (File.Exists(_path))
                return true;

            return false;
        }

        public void WriteFile(string data)
        {
            using (StreamWriter writer = new StreamWriter(_path, true))
            {
                writer.WriteLine(data + "\n");
            };
        }

        public IEnumerable ReadFile()
        {
            List<string[]> fileData = new List<string[]>();

            using (StreamReader reader = new StreamReader(_path))
            {
                string[] fileRecords = (reader.ReadToEnd()).Split('\r');
                foreach (var records in fileRecords)
                {
                    if (!records.Equals("\r"))
                    {
                        var cleanRecords = records.TrimStart('\n').TrimEnd('\n');
                        if (string.IsNullOrWhiteSpace(cleanRecords))
                            break;

                        var record = cleanRecords.Split('\n');
                        fileData.Add(record);
                    }
                }
            };

            return fileData;
        }
    }
}