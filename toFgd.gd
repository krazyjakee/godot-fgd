extends SceneTree

func _init():
  var files = get_files()
  var properties = get_entity_properties(files)
  print(JSON.stringify(properties, " "))
  quit()

func get_files(entities_dir = "entities"):
  # Define the root directory to search
  var root_dir = "res://%s" % entities_dir
  var dir = DirAccess.open(root_dir)
  var files = []
  var folders = []

  # Get all files in the directory
  dir.list_dir_begin()
  while true:
    var file = dir.get_next()
    if file == "":
      break
    if dir.current_is_dir():
      folders.append(file)
    else:
      files.append("%s/%s" % [entities_dir, file])
  dir.list_dir_end()

  for folder in folders:
    # Recursively get all files in the subdirectories
    files += get_files("%s/%s" % [entities_dir, folder])

  return files

func get_entity_properties(files = []):
  var properties = {}

  for file in files:
    if file.ends_with(".tscn"):
      properties[file] = scene_loader(file)
    elif file.ends_with(".gd"):
      properties[file] = script_loader(file)
    else:
      continue
  
  return properties

func scene_loader(path):
  var scene = load(path)
  var script = scene.get_script()
  return filter_properties(script.get_script_property_list()) if script else []

func script_loader(path):
  var script = load(path)
  return filter_properties(script.get_script_property_list())

func filter_properties(properties = []):
  # Filter out properties that are not exposed to the editor
  var filtered_properties = []
  for property in properties:
    if property.type > 0:
      filtered_properties.append(property)
  return filtered_properties

func type_converter(type: int):
  # Convert the type to a string
  var types = {
    1: "bool",
    2: "integer",
    3: "float",
    4: "string",
    20: "color255",
  }
  return types[type] if type in types else "string"