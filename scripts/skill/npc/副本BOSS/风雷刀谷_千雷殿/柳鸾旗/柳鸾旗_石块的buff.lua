---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_石块的buff.lua
-- 更新时间:	2017/2/16 19:51:34
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		local boss = scene.GetNpcByNickName("liuluanqiboss")
		if not boss then
			npc.SetDisappearFrames(1, 0)
		end

		if boss and boss.bFightState == false then
			npc.SetDisappearFrames(1, 0)
		end

		if npc.nZ >= 1361628 then
			npc.FireAIEvent(2001, 0, 0)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com