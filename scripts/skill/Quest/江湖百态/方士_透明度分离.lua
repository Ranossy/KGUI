---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_透明度分离.lua
-- 更新时间:	2016/11/7 9:13:55
-- 更新用户:	qinfupi
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local buffChuhun = player.GetBuff(10827, 1) --每跳自检，身上无buff10827则自己删除
	if not buffChuhun then
		player.DelBuff(11494, 1)		--每跳自检，不是方士状态则删除
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com