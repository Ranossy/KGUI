---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_盲眼血仆_嗅觉追踪.lua
-- 更新时间:	2014/10/10 16:27:59
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)

end

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local npc = GetNpc(nCustomValue)
	if not npc then
		return
	end
	---[[NPC死亡的瞬间做标记，此时删除BUFF不受伤害。
	if npc.GetCustomInteger1(10) ~= 0 then
		--print("删除追踪标记2")
		return
	end
	--]]
	--print("111111")
	if nLeftFrame ~= 0 then
		if player.bFightState == false then
			return
		end
		--print("222222")
		--------------如果NPC身上没有狂怒效果，则发送2001事件，进入困惑状态---
	
		local level = 1		
		local scene = player.GetScene()
		if scene.dwMapID == 199 then
			level = 2
		elseif scene.dwMapID == 206 then
			level = 3
		elseif scene.dwMapID == 212 then
			level = 4
		end
		--print("333333")
		local buff_kb = npc.GetBuff(8225, 1)         --狂暴BUFF
		local buff_kh = npc.GetBuff(8226, 1)         --困惑BUFF
		if not buff_kb and not buff_kh then          --两种BUFF都没有时，发送事件。
			npc.FireAIEvent(2001, 0, 0)
		end
		--print("44444")
		npc.CastSkill(13035, level, TARGET.PLAYER, player.dwID)
		npc.DelBuff(8707, 1)
--print("5555")
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com