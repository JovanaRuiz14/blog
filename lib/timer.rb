# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
class Timer
   def initialize(app)
     @app = app
   end
   def call(env)
      start = Time.now
      status, headers, response = @app.call(env)
      stop = Time.now
      headers['X-Timing'] = (stop -start).to_s
      [status, headers,response]
    end
end
