# frozen_string_literal: true

# Helper de ajuda aos steps
def screenshot_name(name_screen)
  data_e_hora = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S-%L')
  foto = if name_screen
           "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}_#{name_screen}.png"
         else
           "#{data_e_hora}_-_#{SELECTED_ENV}_#{SELECTED_BROWSER}.png"
         end
  caminho_screenshot = SCREENSHOT_PATH + foto
  page.save_screenshot(caminho_screenshot, full: true)
  attach(caminho_screenshot, 'image/png')
end

def screenshot
  screenshot_name(false)
end

def expect_true_data_exist(data)
  data_exist = ![nil, '', false].include?(data)
  expect(data_exist).to eql true
  print_log data
end

def print_log(log_user)
  log log_user if ENV['CI'].blank?
end
