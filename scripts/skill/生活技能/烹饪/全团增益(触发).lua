--生活技能烹饪、医术BUFF类技能
--郑海星
--20110427

--------------我不是分割线----------------------------------------------------

tSkillData =
{
      	{BUFFID = 2999,BUFFLEVEL = 1 }, 
        {BUFFID = 3000,BUFFLEVEL = 1 }, 
        {BUFFID = 3001,BUFFLEVEL = 1 },
        {BUFFID = 3002,BUFFLEVEL = 1 },
        {BUFFID = 3003,BUFFLEVEL = 1 },
        
        
        
        
        
        
        
        
        
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--设置Buff---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        tSkillData[dwSkillLevel].BUFFID,
        tSkillData[dwSkillLevel].BUFFLEVEL
    );
	
--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------


	
--设置其他参数-------
  
    --内力消耗
    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 10 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度
    skill.nAreaRadius 		= 20 * LENGTH_BASE;	
    skill.nTargetCountLimit		= 6;						--作用范围
    --skill.bIsFormationSkill		= true
    --skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--npc: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end



 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com