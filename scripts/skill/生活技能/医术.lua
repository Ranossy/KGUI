------------------------------------------------
-- 文件名    :  医术.lua
-- 创建人    :  陈翰林	
-- 创建时间  :  2007-9-26
-- 用途(模块):  生活技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  生活技能
-- 技能名称  :  医术
-- 技能效果  :  喝药后获得各种效果
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{ 
	{nAttrib1 = 50 , nAttrib2 = 0 , nType = 1}, --下品止血散
  {nAttrib1 = 120 , nAttrib2 = 0, nType = 2}, --下品活络散
  {nAttrib1 = 400 ,nAttrib2 = 1 , nType = 3}, --下品健骨散
  {nAttrib1 = 401 ,nAttrib2 = 1 , nType = 3}, --下品护心散
  {nAttrib1 = 55 ,nAttrib2 = 80 , nType = 4}, --下品万灵散
  {nAttrib1 = 402 ,nAttrib2 = 1 , nType = 3}, --下品强身散
  {nAttrib1 = 403 ,nAttrib2 = 1, nType = 3}, --下品聚魂散
  {nAttrib1 = 160 ,nAttrib2 = 0, nType = 1}, --中品止血散
  {nAttrib1 = 404 ,nAttrib2 = 1 , nType = 3}, --下品金创散
  {nAttrib1 = 270 ,nAttrib2 = 0, nType = 2}, --中品活络散
  {nAttrib1 = 405 ,nAttrib2 = 1 , nType = 3}, --下品补筋散
  {nAttrib1 = 400 ,nAttrib2 = 2, nType = 3}, --下品健骨散2
  {nAttrib1 = 406 ,nAttrib2 = 1, nType = 3}, --下品定痛散
  {nAttrib1 = 407 ,nAttrib2 = 1 , nType = 3}, --飞鱼丸
  {nAttrib1 = 0,nAttrib2 = 0, nType = 3}, --下品避水银针
  {nAttrib1 = 240 ,nAttrib2 = 0, nType = 1}  --上品止血散
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
    local dwSkillLevel = skill.dwLevel;

if tSkillData[dwSkillLevel].nType == 1 then    
	
			skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
    skill.SetNormalCoolDown(2, 77);
    
end



if tSkillData[dwSkillLevel].nType == 2 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CURRENT_MANA,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
     skill.SetNormalCoolDown(2, 78);
end

if tSkillData[dwSkillLevel].nType == 3 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF,
        tSkillData[dwSkillLevel].nAttrib1,
        tSkillData[dwSkillLevel].nAttrib2
    );
end


if tSkillData[dwSkillLevel].nType == 4 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CURRENT_MANA,
        tSkillData[dwSkillLevel].nAttrib2,
        0
    );
    skill.SetNormalCoolDown(2, 77);
    skill.SetNormalCoolDown(3, 78);
end

   ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetNormalCoolDown(1, 76);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
   -- skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度
    
    --skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end


function CanLearnSkill(skill, player)
end

function OnSkillLevelUp(skill, player)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com