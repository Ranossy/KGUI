---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_接引人逃跑.lua
-- 更新时间:	2014/5/19 16:05:48
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local playerlist = scene.GetAllPlayer()
	if #playerlist == 0 then
		npc.FireAIEvent(2002, 0, 0)
	end
	--[[for i = 1, 14 do
		local guankajingrui = scene.GetNpcByNickName("guankajingrui" .. i)
		if guankajingrui then
			if guankajingrui.bFightState == true then
				npc.FireAIEvent(2001, 0, 0)
			end
		end
	end--]]
	for i = 1, #playerlist do
		local playertarget = GetPlayer(playerlist[i])
		if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
			if playertarget.bFightState == true then
				if GetCharacterDistance(npc.dwID, playertarget.dwID) <= 1280 then
					npc.FireAIEvent(2001, 0, 0)
					break
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com