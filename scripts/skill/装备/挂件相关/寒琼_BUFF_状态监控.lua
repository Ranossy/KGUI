---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/寒琼_BUFF_状态监控.lua
-- 更新时间:	2016/8/19 10:59:33
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	--检查BUFF和NPC存在与否
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.dwBackItemIndex ~= 18380 then
		player.DelBuff(11115, 1)
		return
	end
	
	local buff = player.GetBuff(1575, 16)
	if buff then
		--if player.GetDynamicSkillGroup() == 0 then
			player.SetDynamicSkillGroup(302)
		--end
	else
		player.DelBuff(11115, 1)
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local buff_san = player.GetBuff(1575, 0)
	if buff_san then
		player.DelBuff(1575, buff_san.nLevel)
	end
	
	if player.GetDynamicSkillGroup() == 302 then
		player.SetDynamicSkillGroup(0)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com