---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_禁断_被凝视.lua
-- 更新时间:	2014/10/2 17:59:47
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("boss4_shisiming")
	if not npc then
		return
	end
	--BOSS不在战斗，或者没有可以追杀的标记，则不处理。
	if npc.bFightState ~= true or npc.GetCustomInteger1(4) == 0 then
		return
	end

	if nLeftFrame == 0 then    -----自然结束，添加增强BUFF
		local LV = 1
		if scene.dwMapID == 199 then
			LV = 2
		elseif scene.dwMapID == 206 then
			LV = 3
		elseif scene.dwMapID == 212 then
			LV = 4
		end
		player.AddBuff(0, 99, 8342, LV)
	else                       --提前结束，向BOSS发事件
		npc.FireAIEvent(2007, 0, nCharacterID)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com