---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/翔鸾舞柳回内力.lua
-- 更新时间:	2013/5/1 10:10:01
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID,dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if not target then
		return
	end
	local buff = target.GetBuffByOwner(7660,1,player.dwID) 
	if buff then
		target.DelBuffByIndex(buff.nIndex)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID,dwSkillSrcID)

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
		
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	local buff = target.GetBuffByOwner(7660,1,player.dwID) 
	if buff then
		target.DelBuffByIndex(buff.nIndex)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com