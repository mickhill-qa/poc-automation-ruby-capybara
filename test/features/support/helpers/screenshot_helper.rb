module ScreenshotHelper
  def screenshot_erro(name_step_erro)
    data_e_hora         = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S-%L').to_s
    data                = Time.now.strftime('%Y-%m-%d').to_s + "/"
    foto                = "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}_ERRO_#{name_step_erro}.png"
    caminho_screenshot  = SCREENSHOT_PATH + data + foto
    erro_scree          = page.save_screenshot(caminho_screenshot)
    shot                = Base64.encode64(File.open(erro_scree, "rb").read)
    attach(shot, 'image/png')
  end
  
  def screenshot
    data_e_hora         = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S-%L').to_s
    data                = Time.now.strftime('%Y-%m-%d').to_s + "/"
    foto                = "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}.png"
    caminho_screenshot  = SCREENSHOT_PATH + data + foto
    page.save_screenshot(caminho_screenshot, full: true)
    attach(caminho_screenshot, 'image/png')
  end
end
