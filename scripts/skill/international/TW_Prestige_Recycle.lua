---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/international/TW_Prestige_Recycle.lua
-- 更新时间:	11/14/11 20:07:01
-- 更新用户:	LILIN1-PC
-- 脚本说明:	
----------------------------------------------------------------------<


function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local buff = player.GetBuff(3477, 1)
	if not buff then
		return
	end
	
	local nPrestige = buff.nCustomValue
	local nCurrentPrestige = player.nCurrentPrestige
	if nCurrentPrestige == 0 then
		return
	end
	if nCurrentPrestige >= nPrestige then
		player.AddPrestige(-nPrestige)
		nPrestige = 0
	else
		player.AddPrestige(-nCurrentPrestige)
		nPrestige = nPrestige - nCurrentPrestige
	end
	
	local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	if nPrestige == 0 then
		player.DelBuff(3477, 1)
		player.SendSystemMessage(GetEditorString(2, 8171))
		Log(
			string.format(
				GetEditorString(2, 8169), 
				player.dwID, player.szName, tTime.year, tTime.month, tTime.day, tTime.hour, tTime.minute
			)
		)
	else
		buff.nCustomValue = nPrestige
		player.SendSystemMessage(
			string.format(
				GetEditorString(2, 8170), nCurrentPrestige, nPrestige
			)
		)
	end
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com