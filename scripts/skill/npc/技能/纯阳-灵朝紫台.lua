------------------------------------------------
-- 文件名    :  纯阳-灵朝紫台.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2008-07-08
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  气场NPC脚本
------------------------------------------------


-- NPC脚本, 对话事件函数
function OnDialogue(npc, player)
	player.OpenWindow(TARGET.NPC, npc.dwID,
		npc.GetAutoDialogString(player.dwID)
	);
end;

-- 气场NPC死亡脚本
function OnDeath(npc, killer)
	
end;

-- 气场
function OnNpcRevive(npc)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com