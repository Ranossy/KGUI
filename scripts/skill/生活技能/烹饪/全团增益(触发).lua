--�������⿡�ҽ��BUFF�༼��
--֣����
--20110427

--------------�Ҳ��Ƿָ���----------------------------------------------------

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

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        tSkillData[dwSkillLevel].BUFFID,
        tSkillData[dwSkillLevel].BUFFLEVEL
    );
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------


	
--������������-------
  
    --��������
    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 10 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�
    skill.nAreaRadius 		= 20 * LENGTH_BASE;	
    skill.nTargetCountLimit		= 6;						--���÷�Χ
    --skill.bIsFormationSkill		= true
    --skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 12;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com