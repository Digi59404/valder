/* plugin-collect-sources-0.0.1.vapi generated by (null) 0.32.1, do not modify. */

namespace bob {
	namespace builder {
		namespace build {
			namespace plugin {
				[CCode (cheader_filename = "plugin-collect-sources-0.0.1.h")]
				public class CollectSourcesPlugin : bob.builder.build.plugin.AbstractBobBuildPlugin {
					public CollectSourcesPlugin ();
					public override void initialize (bob.builder.recipe.plugin.BobBuildPluginRecipe pluginRecipe) throws bob.builder.build.plugin.BobBuildPluginError;
					public override void run (bob.builder.recipe.project.BobBuildProjectRecipe projectRecipe, bob.builder.filesystem.DirectoryObject projectDirectory) throws bob.builder.build.plugin.BobBuildPluginError;
				}
				[CCode (cheader_filename = "plugin-collect-sources-0.0.1.h")]
				public class ValaFilesVisitor : bob.builder.filesystem.visitor.FileSystemFilteringVisitor {
					public ValaFilesVisitor (string valaFilesDirectory);
					public void collectSourceFiles () throws GLib.Error;
					public override void visitFileFiltered (GLib.File file);
					public signal void valaFileFound (GLib.File valaFile);
				}
			}
		}
	}
}
[CCode (cheader_filename = "plugin-collect-sources-0.0.1.h")]
public static void initializePlugin (bob.builder.build.plugin.BobBuildPluginLoader pluginsLoader);
[CCode (cheader_filename = "plugin-collect-sources-0.0.1.h")]
public static string[] getDependencies ();
