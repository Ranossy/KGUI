---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/盾冲_沿途放击退.lua
-- 更新时间:	2014/9/26 14:19:44
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.CastSkill(13207, 1)
	--player.PlaySfx(331, 0, 0, 0)
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com