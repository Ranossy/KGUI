---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/长歌门特殊武器_玩家esc后取消释放.lua
-- 更新时间:	2016/8/22 11:23:35
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		--if player.GetOTActionState() ~= 1 or player.GetOTActionState() ~= 2 then
			--print("222222")
			--player.DelBuff(10521, 1)
		--end

		if player.GetOTActionState() ~= 2 then
			player.DelBuff(10521, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com