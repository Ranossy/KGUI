---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/镇派/人剑合一回血1.lua
-- 更新时间:	2013/6/5 0:28:41
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20111111
 
------------------------------------------------

--------------脚本文件开始------------------------------------------------

function Apply(dwCharacterID)
	--print(111111)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	--print(player.szName)
	local buff = player.GetBuff(1909, 1)
	local time = buff.nStackNum
	--print("time" .. time)
	player.AddBuff(dwCharacterID, player.nLevel, 6079, time, 1)
	for i = 1, time do
		--print(222222)
		if player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
			--print(333)
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.01 
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.05
		end
	end
	for m = 1, 10 do
		player.DelBuff(1909, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com