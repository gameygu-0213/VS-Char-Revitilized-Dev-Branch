// This Class handles the Caching of the last successfully grabbed Version
package backend;

import sys.FileSystem;
import sys.io.File;
using StringTools;

class VersionCacher {

    // code that i'd rather just have in its own class cause its a lot lmao PLUS I GET TO PUT SHIT INTO THE THING
    public static inline function cacheUpdate(
        updateVersion:String, // The version its caching/comparing just passthrough the updateVersion variable
        cachePath:String = 'assets/VersionCache', // the place you're caching the version to
        saveOverReadme:Bool = true, // whether to save over the readme
        bothVersionsPresent:Bool = false, // whether to failsafe save over the previous caching
        cacheFileName:String = 'gitVersionCache', // the filename of the cached version
        updateVerTmp:String = '', // Used in conjunction with bothVersionsPresent, simply feed it a previous version caching string like chaining Char Engine's update cacher, with the update version from VS Char's
        updateFileNameTmp:String = '') // Used to passthrough the original update filename, in case they differ.
        {
            var folderPath:String = './' + cachePath + '/';
            var path:String = folderPath + cacheFileName + '.txt'; // so you only need to add the name lmao.
            var readmePath:String = folderPath + 'readme.txt';
    
            // Caching the last version successfully found
                if ((!FileSystem.exists(folderPath)) == true) {
                FileSystem.createDirectory(folderPath);
                trace("Created " + folderPath + " Directory, Saving engineVersion cache");
                File.saveContent(path, updateVersion);
                if (saveOverReadme){
                    File.saveContent(readmePath, 'this is where i cache the last successful version grabbed,\nmess with it and itll just overwrite it with the latest version of "gitVersion.txt" from the Repo');
                }
                if (bothVersionsPresent) {
                    path = folderPath + updateFileNameTmp + '.txt';
                    File.saveContent(path, updateVerTmp);
                    trace('Version Successfully cached: ' + updateVerTmp);
                }
                trace("Engine Version Successfully cached: " + updateVersion);}
    
                // if its found, and its a lower version, replace it as long as caching is enabled
                if (ClientPrefs.data.enableCaching) {
                if ((!FileSystem.exists(folderPath)) != true) {
                var CachedVersion = sys.io.File.getContent(path);
                if (updateVersion != CachedVersion){
                trace("Offline" + cacheFileName + "out of date, replacing it with v" + updateVersion);
                if (!FileSystem.exists(folderPath)){
                FileSystem.deleteDirectory(folderPath);
                }
                    
                if (!FileSystem.exists(folderPath)) {
                    FileSystem.createDirectory(folderPath);
                }
                File.saveContent(path, updateVersion);
                if (saveOverReadme){
                    File.saveContent(readmePath, 'this is where i cache the last successful version grabbed,\nmess with it and itll just overwrite it with the latest version of "gitVersion.txt" from the Repo');
                }
                if (bothVersionsPresent) {
                    path = folderPath + updateFileNameTmp + '.txt';
                    File.saveContent(path, updateVerTmp);
                    trace('Version Successfully cached: ' + updateVerTmp);
                }
                trace(cacheFileName + " cache up to date!!!!");}
                else if (updateVersion == CachedVersion) {
                trace(cacheFileName + " cache already up to date, no changes!");}
            }
        }
    }
}