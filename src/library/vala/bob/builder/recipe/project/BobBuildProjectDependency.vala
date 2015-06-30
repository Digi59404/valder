using bob.builder.json;

namespace bob.builder.recipe.project {

    public class BobBuildProjectDependency {

        private const string VERSION_NONE = "-";

        private const string MEMBER_DEPENDENCY = "dependency";
        private const string MEMBER_VERSION = "version";
        private const string MEMBER_TYPE = "type";
        private const string MEMBER_VAPI_DIRECTORY = "vapi-directory";
        private const string MEMBER_C_HEADERS_DIRECTORY = "c-headers-directory";

        private const string TYPE_PKG = "pkg";

        public BobBuildProjectDependency.fromJsonObject(JsonObject jsonObject) {
    		dependency = jsonObject.getStringEntry(MEMBER_DEPENDENCY, null);
    		version = jsonObject.getStringEntry(MEMBER_VERSION, VERSION_NONE);
    		dependencyType = jsonObject.getStringEntry(MEMBER_TYPE, null);
            vapiDirectory = jsonObject.getStringEntry(MEMBER_VAPI_DIRECTORY, null);
            cHeadersDirectory = jsonObject.getStringEntry(MEMBER_C_HEADERS_DIRECTORY, null);
        }

        public BobBuildProjectDependency.newPkgDependency() {
            dependencyType = TYPE_PKG;
        }
        
        public string toString() {
            if (isNonVersion()) {
                return dependency;
            }
            return "%s-%s".printf(dependency, version);
        }

        public bool equals(BobBuildProjectDependency other) {
            return other.dependency == dependency &&
                other.version == version;
        }

        public string dependency { get; set; }
        public string version { get; set; }
    	public string dependencyType { get; set; }
        public string vapiDirectory { get; set; }
        public string cHeadersDirectory { get; set; }

        private bool isNonVersion() {
            return version == VERSION_NONE || version == null;
        }

        public JsonObject toJsonObject() {
            JsonObject jsonObject = new JsonObject();
            jsonObject.setStringEntry(MEMBER_DEPENDENCY, dependency);
            jsonObject.setStringEntry(MEMBER_TYPE, dependencyType);
            jsonObject.setStringEntry(MEMBER_VAPI_DIRECTORY, vapiDirectory);
            jsonObject.setStringEntry(MEMBER_C_HEADERS_DIRECTORY, cHeadersDirectory);
            if (!isNonVersion()) {
                jsonObject.setStringEntry(MEMBER_VERSION, version);
            }
            return jsonObject; 
        }
    }

}