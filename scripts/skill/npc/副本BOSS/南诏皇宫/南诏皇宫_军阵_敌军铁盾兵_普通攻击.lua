------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-10-13
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID,dwSkillSrcID)
	local cNpc = GetNpc(dwSkillSrcID)
	if not cNpc then
		return
	end
	local tNpc = GetNpc(dwCharacterID)
	if not tNpc then
		return
	end
	if tNpc.dwModelID == 27153 or tNpc.dwModelID == 27154 or tNpc.dwModelID == 27397 or tNpc.dwModelID == 27396 or tNpc.dwModelID == 27151 or tNpc.dwModelID == 27152 or tNpc.dwModelID == 29915 then
		cNpc.CastSkill(4784, 6,TARGET.NPC,dwCharacterID)
	elseif  tNpc.dwModelID == 37395 then
		cNpc.CastSkill(4786, 6,TARGET.NPC,dwCharacterID)
	else
		cNpc.CastSkill(4785, 6,TARGET.NPC,dwCharacterID)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com