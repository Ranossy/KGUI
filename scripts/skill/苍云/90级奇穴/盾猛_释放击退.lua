---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/盾猛_释放击退.lua
-- 更新时间:	2014/10/9 22:18:06
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(13414) == 1 then -- 点出残裂后击退目标
		player.CastSkill(13101, 1, player.GetSkillTarget())
	else
		player.CastSkill(13579, 1, player.GetSkillTarget())
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com