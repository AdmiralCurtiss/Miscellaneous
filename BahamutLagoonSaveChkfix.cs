using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BahamutLagoonSaveChkfix {
	class Program {
		static void Main( string[] args ) {
			if ( args.Length < 1 ) {
				Console.Write( "Fixes checksum of SFC Bahamut Lagoon save files." );
				Console.Write( "Usage: BahamutLagoonSaveChkfix save.srm" );
				return;
			}
			string path = args[0];
			var file = System.IO.File.Open( path, System.IO.FileMode.Open );

			int checksum = 0;
			for ( int i = 0; i < 0x1F00; i += 2 ) {
				checksum += file.ReadUInt16();
			}

			file.Position = 0x1FF0;
			file.WriteUInt16( (ushort)( checksum & 0xFFFF ) );

			file.Close();

			return;
		}
	}
	static class Util {
		public static ushort ReadUInt16( this System.IO.Stream s ) {
			int b1 = s.ReadByte();
			int b2 = s.ReadByte();

			return (ushort)( b2 << 8 | b1 );
		}
		public static void WriteUInt16( this System.IO.Stream s, ushort num ) {
			s.Write( BitConverter.GetBytes( num ), 0, 2 );
		}
	}
}
