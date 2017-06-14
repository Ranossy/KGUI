---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/安史之乱_苏曼莎_德音莫违_爆炸.lua
-- 更新时间:	2013/5/29 11:36:27
-- 更新用户:	LILIN1-PC
-- 脚本说明:	
----------------------------------------------------------------------<

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(5839, 1) then
		player.DelGroupBuff(5839, 1)
	end
end

function UnApply(dwCharacterID)
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com