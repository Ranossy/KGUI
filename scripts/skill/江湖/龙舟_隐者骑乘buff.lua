---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/龙舟_隐者骑乘buff.lua
-- 更新时间:	2017/5/20 19:44:03
-- 更新用户:	xutong1-pc
-- 脚本说明:
----------------------------------------------------------------------<
--Include("scripts/Map/节日端午/include/端午龙舟大战头文件.lua")
--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--if not IfBattle(player) then--用于判断本场景的战斗是否开启 true:进行中。false：关闭。
	--LongZhou_End(player)
	--return
	--end
	player.SetDynamicSkillGroup(338)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(0)
	player.DelBuff(11996, 1)
	player.DelGroupBuff(9001,1)
	player.DelGroupBuff(9002, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com