---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/金刚怒目_对自己3.lua
-- 更新时间:	2013/4/24 20:18:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	local tlevel = 5
	tplayer.AddBuff(tplayer.dwID, tplayer.nLevel, 3885, tlevel, 36)	

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com