---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/帮会/帮会_共战防工作室.lua
-- 更新时间:	2016/10/10 19:05:58
-- 更新用户:	qinfupi
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local buffGongzhanID = 3219	--共战buff
	local buffDongjieID = 11493	--共战冻结buff，狸猫换太子
	local player = GetPlayer(dwCharacterID)
	
	if player.bFarmerLimit or player.bNewFarmerFlag then
		if(player.GetBuff(buffGongzhanID,10)) then
			local nCount = player.GetBuff(buffGongzhanID,10).nLeftActiveCount	--这两个buff每跳间隔相同，将剩余跳数转移
			player.DelBuff(buffGongzhanID, 10)
			player.AddBuff(player.dwID,player.nLevel, buffDongjieID,1,nCount)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(11, 1826), 4)
		end
	else
		if(player.GetBuff(buffDongjieID,1)) then
			local nCount = player.GetBuff(buffDongjieID,1).nLeftActiveCount		--这两个buff每跳间隔相同，将剩余跳数转移
			player.DelBuff(buffDongjieID, 1)
			player.AddBuff(player.dwID,player.nLevel, buffGongzhanID,10,nCount)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(11, 1825), 4)
		end
	end	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com