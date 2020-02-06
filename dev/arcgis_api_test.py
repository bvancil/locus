# Following https://developers.arcgis.com/labs/python/download-data/

from arcgis.gis import GIS

from pathlib import Path
from zipfile import ZipFile

def get_public_arcgis_resource(gis_login, item_id, file_name='payload', unzip=False):
  '''Get an ArcGIS resource like 
  https://www.arcgis.com/home/item.html?id=a35c325d7bf946b1bf038cea9ebbfeeb
  using the ESRI API
  
  Note: If downloading a zip file, file_name must have an
  extension.'''
  
  data_item = gis_login.content.get(item_id)
  if data_item is None:
    # TODO: Use a better exception.
    raise(ValueError('The data_item returned by the server is blank. Something went wrong', 'item_id = ', item_id))

  print(data_item)
  container_dir = data_item.title
  output_dir = Path('.') / 'data' / 'raw' / item_id
  if not output_dir.exists():
    output_dir.mkdir(parents=True)

  
  # Download
  rv = data_item.download(save_path=output_dir, file_name=file_name)
  print(f'rv={rv}')
  payload_path = output_dir / file_name
  if not payload_path.exists():
    print(f'Something went wrong downloading id = "{item_id}" to "{zip_path}"')
    # exit()
  
  
  if unzip:
    # Unzip
    unzipped_dir = output_dir / payload_path.stem
    zip_file = ZipFile(payload_path)
    zip_file.extractall(path=unzipped_dir)
    return list(file.name for file in unzipped_dir.glob('*'))
  else:
    return payload_path

if __name__ == '__main__':
  # Connect anonymously
  anon_gis = GIS()
  
  # Download sample
  print(get_public_arcgis_resource(
    gis_login=anon_gis, 
    item_id='a04933c045714492bda6886f355416f2',
    file_name='LAHubDatasets.zip',
    unzip=True
  ))
  
  # Download Length of Growing Season by State
  print(get_public_arcgis_resource(
    gis_login=anon_gis, 
    item_id='a35c325d7bf946b1bf038cea9ebbfeeb',
    file_name='length_of_growing_season_by_state.json'
  ))
  
  
