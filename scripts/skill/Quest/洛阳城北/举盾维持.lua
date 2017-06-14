---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/洛阳城北/举盾维持.lua
-- 更新时间:	2016/9/25 15:53:38
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID, dwSkillSrcID)
--	print("Apply")
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		
	end
	if npc.nMoveState == MOVE_STATE.ON_STAND or npc.nMoveState == MOVE_STATE.ON_RUN or npc.nMoveState == MOVE_STATE.ON_WALK then
		npc.AddBuff(npc.dwID, npc.nLevel, 11154, 1,2)
	
	else
		npc.AddBuff(npc.dwID, npc.nLevel, 11315, 1,6)--破盾
	end
--	print("UnApply")
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
--	print("OnRemove")
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com