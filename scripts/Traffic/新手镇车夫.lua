---------------------------------------------------------------------->
-- 脚本名称:	新手镇车夫.lua
-- 更新时间:	09/09/08 15:10:42
-- 更新用户:	zhouhengda
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Dungeon.lh")
Include("scripts/Map/世界通用/include/秘境入口函数文件.lh")

function OnDialogue(npc, player)

		if player.nLevel >= 48 then
			player.OpenWindow(TARGET.NPC, npc.dwID, 
				npc.GetAutoDialogString(player.dwID).. "\n" .. "<$C " .. tTrafficMafu["fengyudaoxiang"] .. ">"
				 .. "\n" .. "<$C " .. tTrafficMafu["fangqi"] .. ">",
				 "Fengyudaoxiang",
				 "Leave")
		else
			player.OpenWindow(TARGET.NPC, npc.dwID, 
				npc.GetAutoDialogString(player.dwID))
		end
end 

function Leave(player, nTargetType, nTargetID, nIndex)
	return
end

function Fengyudaoxiang(player, nTargetType, nTargetID, nIndex)
	-----------------------------------------------------
	--跨地图界面配置
	local buff_test = player.GetBuff(8851, 1)--20150330用于研发中防止影响体肤
	if not buff_test then--无测试BUFF用新功能
		
		local dwWindowID = 30
		local scene = player.GetScene()
		if scene.dwMapID == 15 then
			dwWindowID = 30
		elseif scene.dwMapID == 6  then
			dwWindowID = 17	
		elseif scene.dwMapID == 8  then
			dwWindowID = 21
		end

		player.OpenSwitchMapWindow(dwWindowID)
		return
	end
	------------------------------------------------------
	
	local npc = GetNpc(nTargetID)
	local szString = GetEditorString(3, 9061)
	OnDialogueOfDungeonEntrance(player, 2, szString, npc)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com