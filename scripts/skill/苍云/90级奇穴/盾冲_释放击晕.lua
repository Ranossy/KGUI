---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/盾冲_释放击晕.lua
-- 更新时间:	2014/9/26 14:21:56
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.CastSkill(13206, 1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com