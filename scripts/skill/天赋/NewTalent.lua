---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天赋/NewTalent.lua
-- 更新时间:	2017/3/29 17:46:19
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
-----------------------------------------------
-- 文件名    :  Talent.lua
-- 创建人    :  Wangtao
-- 创建时间  :  2013-04-26
-- 用途(模块):  新天赋系统
-- 用途  	 :  Server端新天赋操作
------------------------------------------------

function DoSelectPoint(player, dwPoint, nSelectIndex)
	--player.SelectNewTalentPoint(dwPoint, nSelectIndex)
	if not player.GetBuff(11840, 1) then
		player.CastSkillXYZ(6191, 1, dwPoint, nSelectIndex, 0)
		player.PlaySfx(512, player.nX, player.nY, player.nZ)
		player.AddBuff(0, 99, 6004, 1, 1)
	else
		player.SendSystemMessage(GetEditorString(11, 4757))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 4685), 4)
	end
end

function DoChangeSet(player, nNewSetIndex)
	if not player.GetBuff(11840, 1) then
		player.AddBuff(0, 99, 6004, 1, 5)
		if player.GetBuff(6004, 1) then
			local nbuff = player.GetBuff(6004, 1)
			nbuff.nCustomValue = nNewSetIndex
		end
		player.CastSkill(9092, 1)
		player.PlaySfx(512, player.nX, player.nY, player.nZ)
	else
		player.SendSystemMessage(GetEditorString(11, 4758))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 4741), 4)
	end
	--player.ChangeNewTalentSet(nNewSetIndex)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com