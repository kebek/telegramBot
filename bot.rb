require 'telegram_bot'

token = '150474994:AAGdc_llwUDNOGk0HkfYnksD8abPWzmc22U' 

=begin
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/now'
      bot.api.send_message(chat_id: message.chat.id, text: "Current rate, #{message.from.first_name}")
    end
  end
end
=end
#=begin
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "All I can do is say hello. Try the /greet command."
    when /greet/i
      greetings = ['Bonjour', 'Hola', 'Hallo', 'Sveiki', 'Namaste', 'Salaam', 'Szia', 'Halo', 'Ciao', 'Ahoi']
      reply.text = "#{greetings.sample}, #{message.from.first_name}. 🤖"
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
#=end