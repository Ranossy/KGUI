---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/沈眠风_狼牙悍将被控状态.lua
-- 更新时间:	2016/9/21 16:50:39
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene.dwMapID == 240 or scene.dwMapID == 250 then
			npc.AddBuff(npc.dwID, npc.nLevel, 11275, 1)
		end

		if scene.dwMapID == 248 then
			npc.AddBuff(npc.dwID, npc.nLevel, 11275, 2)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com