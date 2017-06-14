------------------------------------------------
-- 文件名    :  天策_技能事件_铁牢律_坚韧.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-02-26 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  虎牙令
-- 技能名称  :  守如山
-- 技能效果  :  被击中后获得坚韧效果
--                  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 10, nBuffID = 202, nBuffLevel = 1},
	
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 202,	1);
	--skill.BindBuff(2, 3930,	1);
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_BUFF,
--        tSkillData[dwSkillLevel].nBuffID,
--        tSkillData[dwSkillLevel].nBuffLevel
--    );

	skill.AddSlowCheckSelfBuff(3930,	0,	BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
    return true;
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com