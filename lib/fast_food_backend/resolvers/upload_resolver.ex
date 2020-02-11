defmodule FastFoodBackendWeb.Resolvers.UploadResolver do
  alias FastFoodBackend.Upload
  alias FastFoodBackend.Repo

  def list(_parent, _args, _resolutions) do
    {:ok, Upload.all()}
  end

  def create(%{:file => file}, _something) do
    file_uuid = UUID.uuid4(:hex)
    image_filename = "file.jpg"
    unique_filename = "#{file_uuid}-#{image_filename}"
    bucket_name = "fastfoodapp"

    {start, length} = :binary.match(file, ";base64,")
    raw = :binary.part(file, start + length, byte_size(file) - start - length)

    decoded = Base.decode64!(raw)

    ExAws.S3.put_object(bucket_name, unique_filename, decoded)
    |> ExAws.request!

    # build the image url and add to the params to be stored
    updated_params = %{:image_url => "https://#{bucket_name}.s3.amazonaws.com/#{bucket_name}/#{unique_filename}"}

    changeset = Upload.changeset(%Upload{}, updated_params)

    Repo.insert(changeset)
  end
end
