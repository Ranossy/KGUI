------------------------------------------------
-- �ļ���    :  ����_���ͷ��ط�ɨҶ.lua
-- ������    :  �²���	
-- ����ʱ��  :  2009-02-10
-- ��;(ģ��):  �书����
-- �书����  :  NPC
-- �书����  :  �⹦
-- �书��·  :  ����������
-- ��������  :  �ط�ɨҶ
-- ����Ч��  :  ���80�⹦�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
  };              


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel	= skill.dwLevel;

  skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		80,
		0
    	);


	

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--    skill.SetPublicCoolDown(16);		-- ����CD1��
--   skill.SetNormalCoolDown(1, 105);		-- CD20��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= 0
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius		= 0;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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