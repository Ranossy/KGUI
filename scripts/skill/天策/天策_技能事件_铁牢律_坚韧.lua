------------------------------------------------
-- �ļ���    :  ���_�����¼�_������_����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-02-26 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ����ɽ
-- ����Ч��  :  �����к��ü���Ч��
--                  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 10, nBuffID = 202, nBuffLevel = 1},
	
};


--�����书���ܼ��������ֵ
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
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
    return true;
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com