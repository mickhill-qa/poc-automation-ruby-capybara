module ScreenshotHelper
  def screenshot_erro(file_name, resultado)
    data                = Time.now.strftime('%Y%m%d').to_s
    horas               = Time.now.strftime('%H%M%S%p').to_s
    caminho_screenshot  = "results/evidencias/#{data}"
    erro_scree          = page.save_screenshot("#{caminho_screenshot}/erro_screen_#{ENV['BROWSER']}_#{data}_#{horas}.png")
    shot                = Base64.encode64(File.open(erro_scree, "rb").read)
    attach(shot, 'image/png')
  end
  
  def screenshot
    data                = Time.now.strftime('%Y%m%d').to_s
    horas               = Time.now.strftime('%H%M%S%p').to_s
    caminho_screenshot  = "results/evidencias/#{data}"
    foto                = "#{caminho_screenshot}/#{ENV['BROWSER']}_#{data}_#{horas}.png"
    page.save_screenshot(foto, full: true)
    attach(foto, 'image/png')
  end
end
