if not doesDirectoryExist("moonloader/config") then createDirectory("moonloader/config") end
require "lib.moonloader"

--Либы
local SE = require 'samp.events'
local imgui = require 'imgui'
local dlstatus = require('moonloader').download_status
local inicfg = require 'inicfg'
local keys = require "vkeys"
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
--

--разное
local tags = "{ff2faa}[FATALITY TOOLS]: "
update_state = false
--

--Версии
local script_vers = 21
local script_vers_text = "0.7"
local last_vers = "0.6"
--
--Ainfo
local file = 'FatalityBinder.ini'
local mainIni = inicfg.load({
    Basic = {
        slot = 'None',
        slot2 = 'None',
        slot3 = 'None',
        slot4 = 'None',
        slot5 = 'None',
		kd = '0',
    },
},file)
if not doesFileExist(thisScript().directory..'/config/'..file..encoding.default) then
    inicfg.save(mainIni, file)
end
--
--ссылки
local update_url = "https://raw.githubusercontent.com/RAZEwallker/binder/main/update.ini"
local update_path = getWorkingDirectory() .. "/config/update.ini"

local script_url = "https://github.com/RAZEwallker/binder/blob/main/FatalityBinder.luac?raw=true"
local script_path = thisScript().path
--

--Окна имнуги
	okno = imgui.ImBool(false)
	main_command = imgui.ImBool(false)
	okno2 = imgui.ImBool(false)
	okno3 = imgui.ImBool(false)
	okno4 = imgui.ImBool(false)
	okno5 = imgui.ImBool(false)
	okno6 = imgui.ImBool(false)
	okno7 = imgui.ImBool(false)
	okno8 = imgui.ImBool(false)
	okno9 = imgui.ImBool(false)
	okno10 = imgui.ImBool(false)
	leader_main = imgui.ImBool(false)
	main_button = imgui.ImBool(false)
	main_obnova = imgui.ImBool(false)
	main_info = imgui.ImBool(false)
	main_reconect = imgui.ImBool(false)
	main_exit = imgui.ImBool(false)
	main_acars = imgui.ImBool(false)
	main_chat = imgui.ImBool(false)
	main_skin = imgui.ImBool(false)
	main_cars = imgui.ImBool(false)
	main_anfo = imgui.ImBool(false)
	main_anfo2 = imgui.ImBool(false)
	main_anti = imgui.ImBool(false)
	main_code = imgui.ImBool(false)
--

--Игмуи части
local yr = imgui.ImBuffer(250)
local nick = imgui.ImBuffer(3)
local cheat = imgui.ImBuffer(250)
local dm = imgui.ImBuffer(250)
local dom = imgui.ImBuffer(5)
local biz = imgui.ImBuffer(3)
local ful = imgui.ImBuffer(3)
local flood = imgui.ImBuffer(250)
local fosk = imgui.ImBuffer(250)
local group1 = imgui.ImBuffer(100)
local group2 = imgui.ImBuffer(100)
local group3 = imgui.ImBuffer(100)
local group4 = imgui.ImBuffer(100)
local group5 = imgui.ImBuffer(100)
local adress = imgui.ImBuffer(100)
local leaderoff = imgui.ImBuffer(100)
local leader = imgui.ImBuffer(100)
local nickoff = imgui.ImBuffer(100)
local leaderid = imgui.ImBuffer(100)
local tempnick = imgui.ImBuffer(100)
local recc = imgui.ImBuffer(100)
local nickname = imgui.ImBuffer(100)
local texit = imgui.ImBuffer(100)
local radius = imgui.ImBuffer(4)
local idskina = imgui.ImBuffer(5)
local mahina = imgui.ImBuffer(1000)
local ainfo1 = imgui.ImBuffer(1000)
local ainfo2 = imgui.ImBuffer(1000)
local ainfo3 = imgui.ImBuffer(1000)
local ainfo4 = imgui.ImBuffer(1000)
local ainfo5 = imgui.ImBuffer(1000)
local ainfo6 = imgui.ImBuffer(1000)
local ainfo7 = imgui.ImBuffer(1000)
local ainfo8 = imgui.ImBuffer(1000)
local ainfo9 = imgui.ImBuffer(1000)
local ainfo10 = imgui.ImBuffer(1000)
local kd = imgui.ImBuffer(5)
local password = imgui.ImBuffer(6)
local code = imgui.ImBuffer(6)
--

function main()
	while not isSampAvailable() do wait(0) end
	downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					updateIni = inicfg.load(nil, update_path)
					if tonumber(updateIni.info.vers) > script_vers then
							sampAddChatMessage(tags.." {ffAAff}Есть обновление! Версия: " .. updateIni.info.vers_text, -1)
							update_state = true
					end
            os.remove(update_path)
        end
	end)
--194.67.195.138
	 print("Проверка сервера...")
    	if sampGetCurrentServerAddress() == "194.67.195.138" or sampGetCurrentServerAddress() == "164.132.201.89" then
    		srv = 1
		elseif sampGetCurrentServerAddress() == "" then
    		srv = 2
		else
			print("Сервер не допущен, работа скрипта завершена")
    		sampAddChatMessage(tags.."{FFFFFF} К сожалению, данный скрипт недоступен для работы на данном сервере.", 0x046D63)
    		sampAddChatMessage(tags.."{FFFFFF} Свяжитесь с разработчиком, если хотите уточнить возможность решения данной проблемы.", 0x046D63)
    		thisScript():unload()
    		return
    	end
    	print("Проверка пройдена, приятной игры")
	sampAddChatMessage(tags..' {ffAAff}Админ Тулс для фаталити нон рп, загружен кмд {ffffff}/ftools или Alt+U', -1)
    wait(5000)
		sampRegisterChatCommand('ftools', ftools)
	while true do
		wait(0)
		if update_state then
				downloadUrlToFile(script_url, script_path, function(id, status)
						if status == dlstatus.STATUS_ENDDOWNLOADDATA then
								sampAddChatMessage(tags.." {ffAAff}Скрипт успешно обновлен!", -1)
								thisScript():reload()
						end
				end)
				break
		end
		if isKeyDown(VK_MENU) and isKeyJustPressed(VK_U) then
			okno.v = not okno.v
			imgui.Process = okno.v
		end
		if not sampIsChatInputActive() then
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_I) then
				main_anti.v = not main_anti.v
				imgui.Process = main_anti.v
			end
		end
		
		if res and recc.v ~= nil then
			sampDisconnectWithReason(quit)
			wait(recc.v*1000)
			sampSetGamestate(1)
			res= false
		end

	end
end

function ftools()
	okno.v = not okno.v
	imgui.Process = okno.v
end

function imgui.OnDrawFrame(param)
	if not okno.v and not main_anti.v and not main_anfo2.v and not main_command.v  and not main_info.v and not okno6.v and not main_button.v and not main_obnova.v then
		imgui.Process = false
	end
	if okno.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 180), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"FATALITY TOOLS v0.7", okno, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
	if imgui.Button(u8"Функции скрипта", imgui.ImVec2(300, 20)) then
		main_command.v = not main_command.v
		Process = main_command.v
	end
	if imgui.Button(u8"Кнопочки", imgui.ImVec2(300, 20)) then
		main_button.v = not main_button.v
		Process = main_button.v
	end
	if imgui.Button(u8"Правила проекта", imgui.ImVec2(300, 20)) then
		okno6.v = not okno6.v
		Process = okno6.v
	end
	if imgui.Button(u8"Информация об обновление", imgui.ImVec2(300, 20)) then
		main_obnova.v = not main_obnova.v
		Process = main_obnova.v
	end
	if imgui.Button(u8"Информация", imgui.ImVec2(300, 20)) then
		main_info.v = not main_info.v
		Process = main_info.v
	end
	imgui.Text(u8"Версия: "..updateIni.info.vers_text, imgui.ImVec2(300, 20))
	imgui.Text(u8"Создатель: 45-й", imgui.ImVec2(300, 20))
	imgui.End()
	end
	if main_anti.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 100), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Безопасность", main_anti, imgui.WindowFlags.NoCollapse)
		imgui.Text(u8"Добро пожаловать на сервер,")
		imgui.Text(u8"снять ошибку безопасности?")
		if imgui.Button(u8"Да",imgui.ImVec2(300, 20)) then
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			imgui.Process = false; showCursor(false);
			sampSendChat("/antierror "..myid)
		end
		if imgui.Button(u8"Нет",imgui.ImVec2(300, 20)) then
		imgui.Process = false; showCursor(false);
		end
	imgui.End()
	end
	if main_anfo2.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 170), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Редактор информации", main_anfo2, imgui.WindowFlags.NoCollapse)
		imgui.InputText("Text #1", ainfo1)
		imgui.InputText("Text #2", ainfo2)
		imgui.InputText("Text #3", ainfo3)
		imgui.InputText("Text #4", ainfo4)
		imgui.InputText("Text #5", ainfo5)
		imgui.InputText(u8"Кд", kd)
		if imgui.Button(u8"Сохранить",imgui.ImVec2(300, 20)) then
			if #ainfo5.v == 0 then
				sampAddChatMessage(tags.."{FF0000}Ошибка, проверьте заполненые ли рядки...", -1)
			else
				mainIni.Basic.slot = ainfo1.v
				mainIni.Basic.slot2 = ainfo2.v
				mainIni.Basic.slot3 = ainfo3.v
				mainIni.Basic.slot4 = ainfo4.v
				mainIni.Basic.slot5 = ainfo5.v
				mainIni.Basic.kd = kd.v
				inicfg.save(mainIni, file)
				sampAddChatMessage(tags.."Сохранение успешно!", -1)
			end
		end
		if imgui.Button(u8"<-- Вернуть обратно",imgui.ImVec2(300, 20)) then
			main_anfo.v = not main_anfo.v
			Process = main_anfo.v
		end
	imgui.End()
	end
	
	if main_command.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(550, 330), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Панель скрипта", main_command, imgui.WindowFlags.NoCollapse )
		if imgui.CollapsingHeader(u8"1. Выдать мут за УР") then
				imgui.InputText(u8"Ид игрока который нарушил", nick)
				imgui.InputText(u8"Время выдачи мута", flood)
			if imgui.Button(u8"Выдать в админ чат") then
					sampSendChat('/amute '..nick.v..' '..yr.v..' УР')
					sampSendChat('/ans '..nick.v..' многократное ур - бан. Не нарушай правила, дружок! : )')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"выдать мут в обычный чат") then
				sampSendChat('/mute '..nick.v..' '..yr.v..' УР')
				sampSendChat('/ans '..nick.v..' многократное ур - бан. Не нарушай правила, дружок! : )')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(обычный чат)") then
				sampSendChat("/unmute "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"2. Выдать бан за вред") then
			imgui.InputText(u8"Ид игрока который нарушил", nick)
			imgui.InputText(u8"Время выдачи бан", cheat)
			if imgui.Button(u8"Выдать бан за нарушение") then
					sampSendChat('/ban '..nick.v..' '..cheat.v..' вред серверу')
			end
		end
		if imgui.CollapsingHeader(u8"3. Выдать тюрму за дм/читы на дм") then
			imgui.InputText(u8"Ид игрока который нарушил", nick)
			imgui.InputText(u8"Время выдачи тюрмы", dm)
			if imgui.Button(u8"Выдать тюрму за дм") then
					sampSendChat('/jail '..nick.v..' '..dm.v..' dm')
					sampSendChat('/ans '..nick.v..' Многократное дм - бан, не нарушай правила (/rules)')
			end
			if imgui.Button(u8"Выдать тюрму за читы на дм") then
					sampSendChat('/dkick '..nick.v)
					sampSendChat('/jail '..nick.v..' '..dm.v..' читы на дм')
					sampSendChat('/ans '..nick.v..' Многократные читы на дм - бан, не нарушай правила (/rules)')
			end
			if imgui.Button(u8"Снять тюрму за неверную выдачу") then
				sampSendChat("/unjail "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"4. Быстрый телепорт к бизнесу, дому, заправке") then
			imgui.InputText(u8"Номер дома", dom)
			imgui.InputText(u8"Номер бизнеса", biz)
			imgui.InputText(u8"Номер заправки", ful)
			if imgui.Button(u8"Телепорт к дому") then
				sampSendChat('/house '..dom.v)
			end
			if imgui.Button(u8"Телепорт к бизнесу") then
				sampSendChat('/biz '..biz.v)
				sampSendChat('/biz '..biz.v)
			end
			if imgui.Button(u8"Телепорт к заправке") then
				sampSendChat('/fuel '..ful.v)
			end
		end
		if imgui.CollapsingHeader(u8"5. Выдача мута за флуд") then
			imgui.InputText(u8"Ид игрока который нарушил", nick)
			imgui.InputText(u8"Время выдачи мута", flood)
			if imgui.Button(u8"Выдать в админ чат") then
				sampSendChat("/amute "..nick.v..' '..flood.v..' Флуд(/a)')
				sampSendChat('/ans '..nick.v..' Многократное флуд - бан, не нарушай правила (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"Выдать в обычный чат") then
				sampSendChat("/mute "..nick.v..' '..flood.v..' Флуд')
				sampSendChat('/ans '..nick.v..' Многократное флуд - бан, не нарушай правила (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(обычный чат)") then
				sampSendChat("/unmute "..nick.v)
			end
			if imgui.Button(u8"Выдать за флуд смс") then
				sampSendChat("/mute "..nick.v..' '..flood.v..' Флуд(/sms)')
				sampSendChat('/ans '..nick.v..' Многократное флуд - бан, не нарушай правила (/rules)')
			end
		end
		if imgui.CollapsingHeader(u8"6. Выдача мута за оскорбления") then
			imgui.InputText(u8"Ид игрока который нарушил", nick)
			imgui.InputText(u8"Время выдачи мута", fosk)
			if imgui.Button(u8"Выдать в админ чат") then
				sampSendChat("/amute "..nick.v..' '..fosk.v..' Оскорбления(/a)')
				sampSendChat('/ans '..nick.v..' Многократное оскорбления - бан, не нарушай правила (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(/a)") then
				sampSendChat("/amute "..nick.v..' 1 1')
			end
			if imgui.Button(u8"Выдать в обычный чат") then
				sampSendChat("/mute "..nick.v..' '..fosk.v..' Оскорбления')
				sampSendChat('/ans '..nick.v..' Многократное оскорбления - бан, не нарушай правила (/rules)')
			end
			imgui.SameLine()
			imgui.Text(">>")
			imgui.SameLine()
			if imgui.Button(u8"Снять мут за неверную выдачу(обычный чат)") then
				sampSendChat("/unmute "..nick.v)
			end
		end
		if imgui.CollapsingHeader(u8"7. Управление ip адрессами") then
			imgui.InputText(u8"id игрока", nick)
			if imgui.Button(u8"Узнать ip адресс") then
				sampSendChat("/getip "..nick.v)
			end
			imgui.InputText(u8"ip адресс игрока", adress)
			if imgui.Button(u8"Забанить ip адресс") then
				sampSendChat("/banip "..adress.v)
			end
			if imgui.Button(u8"Проверить аккаунты ip") then
				sampSendChat("/lip "..adress.v)
			end
			if imgui.Button(u8"Разбанить ip адресс") then
				sampSendChat("/unbanip "..adress.v)
			end
		end
		if imgui.CollapsingHeader(u8"8. Панель управление лидерками") then
			if imgui.Button(u8"Узнать id лидерки") then
				sampSendChat("/fid")
			end
			lua_thread.create(function()
			imgui.InputText(u8"id игрока", nick)
			imgui.InputText(u8"id лидерки", leaderid)
			imgui.InputText(u8"Ник старого лидера", nickoff)
			if imgui.Button(u8"Поставить игрока лд/снять старого") then
				sampSendChat("/uninviteoff "..nickoff.v)
				wait(1000)
				sampSendChat("/setleader "..nick.v.." "..leaderid.v.." 1")
			end
			end)
			imgui.InputText(u8"id врем.лидера", tempnick)
			if imgui.Button(u8"Снять врем.лидера за нарушение") then
				sampSendChat("/auninvite "..tempnick.v.." 1")
			end
		end
		if imgui.CollapsingHeader(u8"9. Реконект") then
			imgui.InputText("Time reconnect", recc)
			if imgui.Button(u8"Запустить") then
				imgui.Process = false; showCursor(false);
				res = true
			end
			if imgui.Button(u8"Быстрый реконект", imgui.SameLine()) then
					imgui.Process = false; showCursor(false);
					sampDisconnectWithReason(quit)
					sampSetGamestate(1)
			end
		end
		if imgui.CollapsingHeader(u8"10. Автовыход") then
			imgui.InputText(u8"Time exit", texit)
			imgui.InputText(u8"You nickname", nickname)
			if imgui.Button(u8"Запустить") then
			imgui.Process = false; showCursor(false);
			lua_thread.create(function()
				sampSendChat("/msg "..tags.." Игрока "..nickname.v.." через "..texit.v.." минут(у) отключит из игры, приятной вам игры")
				wait(texit.v*60000)
				sampSendChat("/group")
				sampSendChat("/gg")
				wait(3000)
				sampProcessChatInput('/q')
			end)
			end
		end
		if imgui.CollapsingHeader(u8"11. Управление машинами сервера") then
			imgui.InputText(u8"Радиус(от 10 до 200)", radius)
			if imgui.Button(u8"Глобальный респавн машин") then
				lua_thread.create(function()
				sampSendChat("/msg Ребят, через 3 секунды будет глобальный респавн машин")
				wait(3000)
				sampSendChat("/spawncars")
				wait(2000)
				sampSendChat("/msg Респавн успешен, удачной Вам игры!")
				end)
			end
			if imgui.Button(u8"Респавн машин в радиусе", imgui.SameLine()) then
				sampSendChat("/respv "..radius.v)
			end
		end
		if imgui.CollapsingHeader(u8"12. Управление чатом") then
			if imgui.Button(u8"Очистить локальный чат", imgui.ImVec2(300, 20)) then
				local memory = require "memory"
				memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
				memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
				memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
				sampAddChatMessage(tags.." {FF22AA}Вы успешно очистили свой локальный чат")
			end
			if imgui.Button(u8"Очистить глобальный чат", imgui.ImVec2(300, 20)) then
				lua_thread.create(function()
				sampSendChat("/msg Ребят, через 5 секунд будет массовая очистка чата")
				wait(5000)
				sampSendChat("/cc")
				wait(2000)
				sampSendChat("/msg Очистка чата прошла успешно, приятной Вам игры!")
				end)
			end
		end
		if imgui.CollapsingHeader(u8"13. Управление скинами") then
			imgui.InputText("##1", idskina)
			imgui.Text(u8"ID skina(от 1 до 311)", imgui.SameLine())
			if imgui.Button(u8"Сменить скин") then
				sampSendChat("/skin "..idskina.v)
			end
			imgui.InputText("##2", nick)
			imgui.Text(u8"Ид игрока", imgui.SameLine())
			if imgui.Button(u8"Выдать скин игроку") then
				sampSendChat("/setskin "..nick.v.." "..idskina.v)
			end
		end
		if imgui.CollapsingHeader(u8"14. Управление транспортом") then
			imgui.InputText("ID`S Cars", mahina)
			if imgui.Button(u8"Выдать данную машину") then
				sampSendChat("/adelveh")
				sampSendChat("/veh "..mahina.v.." 1 1")
			end
		end
		if imgui.CollapsingHeader(u8"15. Кастомная информация") then
			imgui.Text(u8"Отображение:")
			imgui.Text(" "..mainIni.Basic.slot)
			imgui.Text(" "..mainIni.Basic.slot2)
			imgui.Text(" "..mainIni.Basic.slot3)
			imgui.Text(" "..mainIni.Basic.slot4)
			imgui.Text(" "..mainIni.Basic.slot5)
			imgui.Text(u8"Время отправки: "..mainIni.Basic.kd..u8" секунд")
			if imgui.Button(u8"Запустить",imgui.ImVec2(300, 20)) then
			lua_thread.create(function()
				sampSendChat("/a "..mainIni.Basic.slot)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot2)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot3)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot4)
				wait(mainIni.Basic.kd*1000)
				sampSendChat("/a "..mainIni.Basic.slot5)
			end)
			end
			if imgui.Button(u8"Далее -->",imgui.ImVec2(300, 20)) then
				main_anfo2.v = not main_anfo2.v
				Process = main_anfo2.v
			end
		end
	imgui.End()
	end
	
	if main_button.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.4, sh / 1.8), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Кнопочки скрипта", main_button, imgui.WindowFlags.NoCollapse )
		if imgui.Button(u8"Быстрый респавн", imgui.ImVec2(300, 20)) then
			sampSendChat("/sp")
		end
		if imgui.Button(u8"Выдача нрг-500", imgui.ImVec2(300, 20)) then
			sampSendChat("/adelveh")
			sampSendChat("/veh 522 1 1 ")
		end
		if imgui.Button(u8"Выдача султана", imgui.ImVec2(300, 20)) then
			sampSendChat("/adelveh")
			sampSendChat("/veh 560 1 1 ")
		end
		if imgui.Button("Killed games", imgui.ImVec2(300, 20)) then
			 sampProcessChatInput('/q')
		end
		if imgui.Button("Head Move", imgui.ImVec2(300, 20)) then
			 sampProcessChatInput('/headmove')
		end
	imgui.End()
	end
	
	if main_obnova.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.3, sh / 1.7), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(500, 200), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Об обновление", main_obnova, imgui.WindowFlags.NoCollapse  + imgui.WindowFlags.NoScrollbar)
		imgui.BeginChild(u8"Об Обновление", imgui.ImVec2(500, 200), false)
		imgui.Text(u8"Об обновление: "..updateIni.info.vers_text)
		imgui.Text(u8"ГЛОБАЛЬНОЕ ОБНОВЛЕНИЕ!")
		imgui.Text(u8"Снять ошибку безопасности можно на клавишу ALT + I")
		imgui.EndChild()
	imgui.End()
	end
	
	if main_info.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.4, sh / 1.5), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 100), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Информация", main_info, imgui.WindowFlags.NoCollapse )
			if imgui.Button(u8"ВКонтакте", imgui.ImVec2(300, 20)) then
			os.execute("start https://vk.com/id662467029")
			end
			imgui.Text(u8"Discord: 45-й#9665", imgui.ImVec2(300, 20))
	imgui.End()
	end

--		if okno9.v then
--		local sw, sh = getScreenResolution()
--		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
--		imgui.SetNextWindowSize(imgui.ImVec2(400, 300), imgui.Cond.FirstUseEver)
--	imgui.Begin(u8"[~~Панель тулса(информативное сообщение)~~]", okno9, imgui.WindowFlags.NoCollapse)
--	imgui.Text(u8'Текст будет:')
--	imgui.Text(group1.v)
--	imgui.Text(group2.v)
--	imgui.Text(group3.v)
--	imgui.Text(group4.v)
--	imgui.InputText(u8"1-й текст", group1)
--	imgui.InputText(u8"2-й текст", group2)
--	imgui.InputText(u8"3-й текст", group3)
--	imgui.InputText(u8"4-й текст", group4)
--	imgui.InputText("##1", group5)
--	imgui.Text(u8"От кого",imgui.SameLine())
--	imgui.Text(u8'Сообщение будет от '..group5.v)
--	if imgui.Button(u8"Оголосить всем информацию") then
--		sampSendChat(u8"/msg "..group1.v)
--		sampSendChat(u8"/msg "..group2.v)
--		sampSendChat(u8"/msg "..group3.v)
--		sampSendChat(u8"/msg "..group4.v)
--		sampSendChat(u8"/msg Приятной вам игры, сообщение от "..group5.v)
--	end
--	imgui.End()
--	end

	if okno6.v then
		local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(1000, 200), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[~~Правила сервера FATALITY NON RP~~]", okno6, imgui.WindowFlags.NoCollapse)
		if imgui.CollapsingHeader(u8"1. Основные") then
			imgui.Text(u8"1.1 - Запрещено использовать вредительские CLEO или читы, наказуемо баном аккаунта до 7 дней")
			imgui.Text(	u8"1.2 - Запрещен намеренный DeathMatch (DM) - намеренное убийство, наказуемо тюрьмой до 15 минут")
			imgui.Text(u8"1.3 - Запрещено убивать игроков на спавне (на месте, где они появляются), наказуемо тюрьмой до 20 минут")
			imgui.Text(u8"1.4 - Запрещены убийства наездом или стрельбы из авто без причины, наказуемо тюрьмой до 15 минут")
			imgui.Text(u8"1.5 - Запрещено использование недоработок сервера для создания неудобств, наказуемо баном аккаунта до 7 дней")
			imgui.Text(u8"1.7 - Запрещено передавать игровой аккаунт (если имеется админка 14+ уровня), наказуемо баном аккаунта до 14 дней")
			imgui.Text(u8"1.8 - Запрещен обман игроков с целью личной выгоды, наказуемо баном аккаунта до 7 дней или баном чата до 120 минут*")
		end
		if imgui.CollapsingHeader(u8"2. Процесс общения") then
			imgui.Text(u8"2.1 - Запрещен частый мат и оскорбление других игроков, наказуемо баном чата до 30 минут")
			imgui.Text(u8"2.2 - Запрещено оскорбление/упоминание родных игроков, наказуемо баном чата до 300 минут")
			imgui.Text(u8"2.3 - Запрещены угрозы другим игрокам (не относящиеся к игровому процессу), наказуемо баном чата до 60 минут")
			imgui.Text(u8"2.4 - Запрещена любая реклама сторонних ресурсов, наказуемо баном чата до 90 минут или баном аккаунта до 7 дней")
			imgui.Text(u8"2.5 - Запрещено флудить (написание одинаковых сообщений больше 5 раз), наказуемо баном чата до 15 минут")
			imgui.Text(u8"2.6 - Запрещено оскорбление сервера или главного администратора, наказуемо баном чата до 120 минут")
		end
		if imgui.CollapsingHeader(u8"3. Администрация") then
			imgui.Text(u8"- Необходимо сообщать администрации сервера о любых случаях нарушения данных правил")
			imgui.Text(u8"- Администрация по правилам выбирает штрафные санкции для каждого конкретного случая")
			imgui.Text(u8"- Санкции могут применяться сразу после нарушения или через время (например, после рассмотрения жалобы)")
			imgui.Text(u8"- Если штрафная санкция была применена к Вам ошибочно, свяжитесь с vk.com/andreylolkek")
		end
		if imgui.CollapsingHeader(u8"4. Для старшей администрации") then
			imgui.Text(u8"4.1 - Если игрок Вас оскорбил в легкой форме (дурак, тупой и тд), наказывать нет необходимости")
			imgui.Text(u8"4.2 - Если игрок Вас оскорбил в средней форме (с исп. нецензуры), наказывать необходимо по п. 2.6")
			imgui.Text(u8"4.3 - Если игрок Вас оскорбил в тяжелой форме (с упом. родных), наказывать необходимо по п. 2.2")
			imgui.Text(u8"4.4 - Если игрок Вас оскорбил в любой форме и использует вредительское ПО, наказывать необходимо по п. 1.1")
			imgui.Text(u8"4.5 - Если игрок получил от Вас бан / выговор / бан чата / тюрьму и снял за репутацию/обошел иным путем, а затем вновь начинает нарушать, то")
			imgui.Text(u8"Вы в праве наказать повторно (но уже с x2 сроком), но при условии, что снятое наказание было выдано за п. 1.1, 1.2, 1.5, 1.7, 1.8, 2.2, 2.4, 2.6 (ВАЖНО)")
		end
		if imgui.CollapsingHeader(u8"5. Особые примечания") then
			imgui.Text(u8"5.1 - Старший администратор превыше игроков, нарушения правил в сторону администратора (кроме п. 2.2) не наказываются")
			imgui.Text(u8"5.2 - Старший администратор обязан следить за помехой игровому процессу для других игроков, а не для себя")
			imgui.Text(u8"5.3 - Старший администратор обязан иметь доказательства на штрафные санкции (п. 1.1, 1.5, 1.7, 1.8, 2.2, 4.1, 4.2, 4.3, 4.4, 4.5)")
			imgui.Text(u8"5.4 - Старший администратор не должен наказывать игроков только по 1 нарушению (п. 1.2, 1.3, 1.4, 1.5, 1.6, 1.8), необходимо проследить за повторением")
		end
		if imgui.CollapsingHeader(u8"6. Система выговоров") then
			imgui.Text(u8"6.1 - Если старший администратор начинает угрожать / оскорблять игроков, то он получит выговор или бан чата до 300 минут*")
			imgui.Text(u8"6.2 - Старший администратор не должен конфликтовать с игроками, серьезные конфликты наказываются выговором")
			imgui.Text(u8"6.3 - Старший администратор - приоритетный пользователь, запрещено вести себя неподобающе (в случае нарушения выговор)")
			imgui.Text(u8"6.4 - Если старший администратор проявляет неуважение к другим старшим администраторам, то есть вероятность получить бан чата до 300 минут")
			imgui.Text(u8"6.5 - Если старший администратор обходит наказание от главного администратора, то наказание будет применено по п. 1.6")
		end
		if imgui.CollapsingHeader(u8"7. Примечание") then
			imgui.TextColored(imgui.ImVec4(1.0, 0.0, 0.0, 1.0 ), u8'* Вид наказания может быть применен по наличию степени нарушения (легкое, среднее, среднее-многочисленное, тяжелое)')
			imgui.TextColored(imgui.ImVec4(1.0, 0.0, 0.0, 1.0 ), u8'* И если вы ГА или ЗГА или просто тот администратор которому не нужны правила, то закройте эту вкладку с правилами')
		end
		imgui.End()
	end
end

function CherryTheme()
  imgui.SwitchContext()
  local style = imgui.GetStyle()
  local colors = style.Colors
  local clr = imgui.Col
  local ImVec4 = imgui.ImVec4
  local ImVec2 = imgui.ImVec2


  style.WindowPadding = ImVec2(6, 4)
  style.WindowRounding = 0.0
  style.FramePadding = ImVec2(5, 2)
  style.FrameRounding = 3.0
  style.ItemSpacing = ImVec2(7, 1)
  style.ItemInnerSpacing = ImVec2(1, 1)
  style.TouchExtraPadding = ImVec2(0, 0)
  style.IndentSpacing = 6.0
  style.ScrollbarSize = 12.0
  style.ScrollbarRounding = 16.0
  style.GrabMinSize = 20.0
  style.GrabRounding = 2.0
  style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

  style.WindowTitleAlign = ImVec2(0.5, 0.5)

  colors[clr.Text] = ImVec4(0.860, 0.930, 0.890, 0.78)
  colors[clr.TextDisabled] = ImVec4(0.860, 0.930, 0.890, 0.28)
  colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
  colors[clr.ChildWindowBg] = ImVec4(0.200, 0.220, 0.270, 0.58)
  colors[clr.PopupBg] = ImVec4(0.200, 0.220, 0.270, 0.9)
  colors[clr.Border] = ImVec4(0.31, 0.31, 1.00, 0.00)
  colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
  colors[clr.FrameBgHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.FrameBgActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.TitleBg] = ImVec4(0.232, 0.201, 0.271, 1.00)
  colors[clr.TitleBgActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
  colors[clr.TitleBgCollapsed] = ImVec4(0.200, 0.220, 0.270, 0.75)
  colors[clr.MenuBarBg] = ImVec4(0.200, 0.220, 0.270, 0.47)
  colors[clr.ScrollbarBg] = ImVec4(0.200, 0.220, 0.270, 1.00)
  colors[clr.ScrollbarGrab] = ImVec4(0.09, 0.15, 0.1, 1.00)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.ScrollbarGrabActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.CheckMark] = ImVec4(0.71, 0.22, 0.27, 1.00)
  colors[clr.SliderGrab] = ImVec4(0.47, 0.77, 0.83, 0.14)
  colors[clr.SliderGrabActive] = ImVec4(0.71, 0.22, 0.27, 1.00)
  colors[clr.Button] = ImVec4(0.47, 0.77, 0.83, 0.14)
  colors[clr.ButtonHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
  colors[clr.ButtonActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.Header] = ImVec4(0.455, 0.198, 0.301, 0.76)
  colors[clr.HeaderHovered] = ImVec4(0.455, 0.198, 0.301, 0.86)
  colors[clr.HeaderActive] = ImVec4(0.502, 0.075, 0.256, 1.00)
  colors[clr.ResizeGrip] = ImVec4(0.47, 0.77, 0.83, 0.04)
  colors[clr.ResizeGripHovered] = ImVec4(0.455, 0.198, 0.301, 0.78)
  colors[clr.ResizeGripActive] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.PlotLines] = ImVec4(0.860, 0.930, 0.890, 0.63)
  colors[clr.PlotLinesHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.PlotHistogram] = ImVec4(0.860, 0.930, 0.890, 0.63)
  colors[clr.PlotHistogramHovered] = ImVec4(0.455, 0.198, 0.301, 1.00)
  colors[clr.TextSelectedBg] = ImVec4(0.455, 0.198, 0.301, 0.43)
  colors[clr.ModalWindowDarkening] = ImVec4(0.200, 0.220, 0.270, 0.73)
end
CherryTheme()