---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/剑胆琴心世界boss/柳时清/柳时清_data.lua
-- 更新时间:	2017/5/31 20:12:28
-- 更新用户:	qingfupei
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Include/Table.lh")

--BOSS本体的数据
WildBoss_LiuShiQing = {}
WildBoss_LiuShiQing.Boss = {}
WildBoss_LiuShiQing.Boss.dwID = 57101		--冰盔龙甲boss本尊
WildBoss_LiuShiQing.Boss.bombID = 57112	--地上的地雷
WildBoss_LiuShiQing.Boss.nJnzkID = 57127 --技能总控NPCID
WildBoss_LiuShiQing.Boss.szNickName = "WildBoss_BKLJ"	--冰盔龙甲
WildBoss_LiuShiQing.Boss.szJnzkName = "WildBoss_LiuShiQing_JNZK"

--BOSS总控的数据
WildBoss_LiuShiQing.Control = {}
WildBoss_LiuShiQing.Control.dwID = 57103
WildBoss_LiuShiQing.Control.szNickName = "WildBoss_LiuShiQingZK"
WildBoss_LiuShiQing.Control.CustumValue = {ConvertProxiedTable = ConvertProxiedTable, -- 总控
	dwBossID = {0, 3}, -- BossID
	dwFlag = {4, 4}, -- 不为0代表非首次创建二阶段BOSS
};WildBoss_LiuShiQing.Control.CustumValue = WildBoss_LiuShiQing.Control.CustumValue:ConvertProxiedTable()


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com