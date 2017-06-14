---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��߹�����ʩ��.lua
-- ����ʱ��:	2013/5/7 21:48:12
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��߷�����ʩ��.lua
-- ������    :  ���	
-- ����ʱ��  :  2009-02-23
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ��߷�����ʩ��.lua
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	--	������ʱ�����BUFF
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DETACH_MULTI_GROUP_BUFF,
		23,
		100
	);
    
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		929, --ʩ�ŵ�hot
		1			--Level
	);

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- skill.SetPublicCoolDown(16);
	--skill.SetPublicCoolDown(592);
	skill.SetNormalCoolDown(1, 592);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

	----------------- ����������� ----------------------------------------
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	
	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 30 * LENGTH_BASE;
	skill.nAngleRange = 256; 	--ȫ��λ
	--����֡��
	skill.nPrepareFrames = 0;	--˲��
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 1000;
	--����
	skill.bIsFormationSkill = true
	--��ѡ��Χ ��ѡ��Χ��������������ж�--
	skill.nFormationRange = 20 * LENGTH_BASE	
	--��Χ��Ա����
	skill.nLeastFormationPopulation = 1	
	
	return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	local dwSkillLevel = skill.dwLevel;
	
	player.LearnSkill(860);--�󷨵�1��
	player.LearnSkill(772);--�󷨵�2��
	player.LearnSkill(773);--�󷨵�3��
	player.LearnSkill(861);--�󷨵�4��
	player.LearnSkill(862);--�󷨵�5��
	player.LearnSkill(863);--�󷨵�6��
	player.LearnSkill(800);--�ر���
	
	
end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com