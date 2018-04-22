package resource.provider;

public class ResourceProvider {
	
	private String mainPath = null;

	public ResourceProvider(String mainPath) {
		super();
		this.mainPath = mainPath;
	}
	
	public String getPath(String storage) {
		return mainPath + storage;
	}
	
}
