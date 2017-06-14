------------------------------------------------
-- 文件名    :  霓裳羽衣_妙舞神扬.lua
-- 创建人    :  张豪	
-- 创建时间  :  2011-4-18
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  内功
-- 武功套路  :  霓裳羽衣
-- 技能名称  :  妙舞神扬
-- 技能效果  :  复活
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill调用/中立使用复活技能活动判断.lua")

tSkillData =
{
	{ nReviveLife = 245, 	nReviveMana = 295, 	nCostMana = 225},
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.REVIVE, 
        tSkillData[dwSkillLevel].nReviveLife,		
        tSkillData[dwSkillLevel].nReviveMana		
    );

	--删除长歌救人标记buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
		);
    
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);	--公共CD
    skill.SetCheckCoolDown(1, 444);
    --skill.SetNormalCoolDown(1, 37);
	
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
    --skill.nCostMana			= 0;
	skill.nCostManaBasePercent = 1365;	-- 技能消耗的内力
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 256; 									--施放角度
    skill.nMinPrepareFrames = 1;
    skill.nPrepareFrames    = 160;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
--判断玩家的状态，以判断是否可以发出技能
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com