module ScreenshotHelper
  def screenshot_erro(name_step_erro)
    data_e_hora         = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S-%L').to_s
    data                = Time.now.strftime('%Y-%m-%d').to_s + "/"
    foto                = "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}_ERRO_#{name_step_erro}.png"
    caminho_screenshot  = SCREENSHOT_PATH + data + foto
    screen_saved        = page.save_screenshot(caminho_screenshot, full: true)
    img_base64          = Base64.encode64(File.open(screen_saved, "r:UTF-8", &:read))
    attach(img_base64, 'image/png;base64')
  end

  def screenshot
    data_e_hora         = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S-%L').to_s
    data                = Time.now.strftime('%Y-%m-%d').to_s + "/"
    foto                = "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}.png"
    caminho_screenshot  = SCREENSHOT_PATH + data + foto
    screen_saved        = page.save_screenshot(caminho_screenshot, full: true)
    img_base64          = Base64.encode64(File.open(screen_saved, "r:UTF-8", &:read))
    attach(img_base64, 'image/png;base64')
  end
end

World ScreenshotHelper
