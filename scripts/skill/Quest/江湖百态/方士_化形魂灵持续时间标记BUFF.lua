---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_化形魂灵持续时间标记BUFF.lua
-- 更新时间:	2016/6/18 11:27:10
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<

--[[魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
--]]
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
--[[	if nLeftFrame == 0 then
		if npc.bFightState == false then
			npc.SetDisappearFrames(1)
		else
			npc.AddBuff(npc.dwID, npc.nLevel, 10862, 1, 1)  --如果NPC在战斗状态则续一秒。
			return
		end
	end
	local dwID = npc.GetCustomInteger4(1)
	local player = GetPlayer(dwID)
	if player then
		player.PlaySfx(1354, npc.nX, npc.nY, npc.nZ)
	else
		npc.PlaySfx(1354, npc.nX, npc.nY, npc.nZ)
		npc.SetDisappearFrames(16)                           --NPC播放特效时,消失时间延长,否则特效播不全
	end	--]]
	if not npc.bFightState and nLeftFrame == 0 then
		npc.dwDropTargetPlayerID = 0
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com