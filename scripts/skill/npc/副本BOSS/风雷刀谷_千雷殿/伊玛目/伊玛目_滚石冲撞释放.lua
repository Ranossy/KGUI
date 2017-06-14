---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/伊玛目/伊玛目_滚石冲撞释放.lua
-- 更新时间:	2017/1/17 10:10:55
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			npc.CastSkill(17296, 1)
		end

		if scene.dwMapID == 270 then
			npc.CastSkill(17296, 2)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com