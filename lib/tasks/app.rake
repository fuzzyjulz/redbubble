namespace :app do
  desc "Generates static pages"
  task :static, [:input_file, :output_dir] => :environment do |object, args|
    app = ActionDispatch::Integration::Session.new(Rails.application)
    ApplicationHelper.source_data_file = args[:input_file] if args[:input_file]
    @output_dir = File.join ([Rails.root, args[:output_dir] || "public" ])
    puts "Outputting to: #{@output_dir}"
 
    writePage(app, "/APPPATH/index.html", "index.html", "./")
    
    create_directory("make")
    Make.all.each do |make|
      writePage(app, "/APPPATH/make/#{make.id}.html", "make/#{make.id}.html", "../")
    end
    
    create_directory("model")
    Model.all.each do |model|
      create_directory("model/#{model.make_id}")
      writePage(app, "/APPPATH/model/#{model.make_id}/#{model.id}.html", "model/#{model.make_id}/#{model.id}.html", "../../")
    end
    
  end
  
  def create_directory(dir)
    dir_path = File.join ([@output_dir, dir])
    Dir.mkdir(dir_path) if not Dir.exists?(dir_path)
  end
  
  def writePage(app, server_path, output_file, path_to_root)
    puts "Generating #{output_file}..."
    outpath = File.join ([@output_dir, output_file])
    resp = app.get(server_path)
    if resp == 200
      File.delete(outpath) unless not File.exists?(outpath)
      File.open(outpath, 'w') do |f|
        f.write(app.response.body.gsub(/\/APPPATH\//, "#{path_to_root}"))
      end
    else
      puts "Error generating #{output_file}!"
    end
  end
end