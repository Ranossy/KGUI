------------------------------------------------
-- ������   :  ����		
-- ����ʱ��	:  2010-11-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
    
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    
    local dwSkillLevel	= skill.dwLevel
	

    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_REPULSED,
		18,  --����ʱ��(֡)
    	0
    );
	
	--skill.BindBuff(1, 452, 1);
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
    --skill.SetNormalCoolDown(1, 80);	--CD20s
    
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0										--����ʩ����С�뾶
    skill.nMaxRadius        = 8 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 128; 									--ʩ�ŽǶ�120��
    
    --skill.nPrepareFrames    = 0;									--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 30;									--�ӵ��ٶ�,��/֡
 	
 	--skill.nDismountingRate  = 1024;									--������Ϊ100%
 	
 	--skill.nDismountingRate  = 1024;									--������Ϊ100%
    
    --skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com